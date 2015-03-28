public class HelloWorld {
    public native void helloWorld();
        
    public static void main(String[] args) {
        new HelloWorld().helloWorld();
    }
    
    static {
        System.loadLibrary("HelloWorld");
    }
}
