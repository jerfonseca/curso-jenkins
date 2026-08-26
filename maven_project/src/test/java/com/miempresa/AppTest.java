package com.miempresa;

import org.junit.Test;
import static org.junit.Assert.assertEquals;

/**
 * Unit test for simple App.
 */
public class AppTest {

    @Test
    public void testSumar() {
        App app = new App();
        int result = app.sumar(2, 3);
        assertEquals(5, result);
    }
}
