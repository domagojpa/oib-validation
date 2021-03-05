import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;

class OibTest {
	
	final static int RES_EXCEPTION = -1;
	final static String OK_OIB = "12345678903";
	final static String WRONG_OIB = "12345678900";
	
	private final static Map<String, Integer> results = new HashMap<>();
	
	static {
		results.put(null, RES_EXCEPTION);
		results.put("", OibValidation.ERR_INVALID_LENGHT);
		results.put("123", OibValidation.ERR_INVALID_LENGHT);
		results.put(" 01234567890 ", OibValidation.ERR_INVALID_LENGHT);
		results.put("           ", OibValidation.ERR_INVALID_FORMAT);
		results.put("X1234567890", OibValidation.ERR_INVALID_FORMAT);
		results.put(WRONG_OIB, OibValidation.ERR_INVALID_CONTROL);
		results.put(OK_OIB, OibValidation.NO_ERROR);
	}

	public static void main(String[] args) {	
		for (Entry<String, Integer> entry : results.entrySet()) {
			test(entry.getKey(), entry.getValue());			
		}	
	}
	
	private static void test(String data, int expectedResult) {
		int result;
		try {
			result = OibValidation.checkOIBState(data);
		} catch (Exception e) {
			result = RES_EXCEPTION;
		}
		checkResult(data, expectedResult, result);
	}
	
	private static void checkResult(String data, int expectedResult, int result) {
		String msg = String.format("data:%-12s\texpected:%d\treceived:%d", data, expectedResult, result);
		String verdict = expectedResult == result ? "OK" : "Fail!"; 
		System.out.println(msg + ";\t" + verdict);
	}
	
}
