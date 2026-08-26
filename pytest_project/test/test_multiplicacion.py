import pytest

def multiplicacion(a, b):
    return a * b

def test_multiplicacion():
    assert multiplicacion(2, 3) == 6
    assert multiplicacion(-1, 1) == -1
    assert multiplicacion(0, 5) == 0

def test_multiplicacion_fail():
    assert multiplicacion(2, 2) == 5  # This test is expected to fail