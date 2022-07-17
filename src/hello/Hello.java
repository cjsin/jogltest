/**
 * This file is originally from https://www.infoworld.com/article/2071845/hello-jogl.html
 * and all I have done here is update the imports for jogamp 2.3.2
 * and I had to change the GL2 to GL4ES3 for it to run
 */
package hello;

import com.jogamp.opengl.GLEventListener;
import com.jogamp.opengl.GLProfile;
import com.jogamp.opengl.awt.GLCanvas;
import com.jogamp.opengl.GLCapabilities;

public class Hello {
    public static void main (String args[]) {
        try {
            System.out.println("Hello World! (The native libraries are installed.)");
            final GLProfile gp = GLProfile.get(GLProfile.GL4ES3);
            GLCapabilities caps = new GLCapabilities(gp);
            System.out.println("Hello JOGL! (The jar appears to be available.)");
        } catch (Exception e) {
            System.out.println(e);
        }
    }
}
