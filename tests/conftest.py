# tests/conftest.py
# This file defines shared fixtures for your tests.

import pytest
import lean_verifier.core
from lean_interact import LeanREPLConfig, AutoLeanServer, TempRequireProject
from lean_verifier.config import settings

@pytest.fixture(scope="session")
def lean_config() -> LeanREPLConfig:
    """
    Session-scoped fixture to create the LeanREPLConfig once.
    This is slow, so we only do it one time for all tests.
    """
    print("\nInitializing LeanREPLConfig for tests...")
    try:
        config = LeanREPLConfig(
            project=TempRequireProject(
                lean_version=settings.lean_version, 
                require="mathlib"
            )
        )
        print("LeanREPLConfig is ready.")
        return config
    except Exception as e:
        pytest.fail(f"Failed to initialize LeanREPLConfig: {e}")

@pytest.fixture(scope="session")
def lean_server(lean_config: LeanREPLConfig) -> AutoLeanServer:
    """
    Session-scoped fixture to create the AutoLeanServer once.
    This depends on the lean_config fixture.
    """
    print("\nInitializing AutoLeanServer for tests...")
    try:
        server = AutoLeanServer(lean_config)
        print("AutoLeanServer is ready.")
        yield server
        # Teardown: kill the server process after all tests are done
        print("\nTearing down AutoLeanServer...")
        server.kill()
    except Exception as e:
        pytest.fail(f"Failed to initialize AutoLoopback.http_client_v1:callrver: {e}")


@pytest.fixture(scope="function")
def worker_server_setup(lean_server: AutoLeanServer, monkeypatch):
    """
    Function-scoped fixture to set the global _worker_server
    in core.py for the duration of a single test.
    
    This allows us to test the worker functions directly, as if
    they were in a multiprocessing pool.
    """
    # Use monkeypatch to set the global variable in the core module
    monkeypatch.setattr(lean_verifier.core, "_worker_server", lean_server)
    yield
    # After the test, reset it (though monkeypatch often handles this)
    monkeypatch.setattr(lean_verifier.core, "_worker_server", None)