# src/lean_verifier/llm_zoo.py
from openai import OpenAI
import google.generativeai as gemini
from lean_verifier.config import settings

class ModelInstance:
    """An abstract representation of a Large Language Model for ease of switching between models."""
    def querry(self, prompt: str) -> str:
        return ""
    
class DummyModelInstance(ModelInstance):
    """A class that stands in for an actual LLM while building and testing code. The best things in life are free."""
    def querry(self, prompt: str) -> str:
        return "  exact \u27e8fun h \u21a6 by rw [Set.mem_Ioo]; constructor <;> nlinarith [h], fun h \u21a6 by rw [Set.mem_Ioo] at h; nlinarith\u27e9"

class ChatGPTInstance(ModelInstance):
    """Represents an instance of a ChatGPT model that tracks a conversation."""
    def __init__(self, settings, system_prompt: str):
        self.settings = settings
        self.messages = [{"role": "system", "content": system_prompt}]
        self.client = OpenAI(api_key=settings.api_keys.get("openai"))
    
    def querry(self, prompt: str) -> str:
        self.messages.append({"role": "user", "content": prompt})
        response = self.client.chat.completions.create(
            model=self.settings.model_name,
            messages=self.messages,
            temperature=self.settings.temperature,
            max_tokens=self.settings.max_tokens,
            timeout=self.settings.timeout_seconds,
        ).choices[0].message.content or ""
        self.messages.append({"role": "assistant", "content": response})
        return response

class GeminiInstance(ModelInstance):
    """Represents an instance of a ChatGPT model that tracks a conversation."""
    def __init__(self, model: str, system_prompt: str):
        gemini.configure(api_key=settings.api_keys.get("gemini"))
        self.model = gemini.GenerativeModel(model)
        self.chat = self.model.start_chat(history=[
            {"role": "user", "parts": [system_prompt]},
            {"role": "model", "parts": ["System prompt aknowledged. I will follow those instructions above all others."]}
        ])

    def querry(self, prompt: str) -> str:
        return self.chat.send_message(prompt).text

        
        
