package com.lenovo.ebank.pub;

import java.util.HashMap;
import java.util.Map;

public class SopIntf {
	public static boolean DEBUG = false;

	public int errcode = 1;
	public String errmsg = "SopIntf stub is active";

	private final Map<String, Map<String, Object>> payloadByBlock = new HashMap<String, Map<String, Object>>();
	private final Map<String, Map<String, String>> responseByBlock = new HashMap<String, Map<String, String>>();

	public static void initEnv(String env) {
	}

	public void put(String block, String key, String value) {
		putObject(block, key, value);
	}

	public void put(String block, String key, byte[] value) {
		putObject(block, key, value);
	}

	public boolean exec(String transactionCode) {
		errcode = 1;
		errmsg = "SOP transaction unavailable in local Docker runtime: " + transactionCode;
		responseByBlock.clear();
		return false;
	}

	public String getStr(String block, String key) {
		Map<String, String> blockData = responseByBlock.get(normalizeBlock(block));
		if (blockData == null) {
			return "";
		}
		String value = blockData.get(key);
		return value == null ? "" : value;
	}

	private void putObject(String block, String key, Object value) {
		String normalizedBlock = normalizeBlock(block);
		Map<String, Object> blockData = payloadByBlock.get(normalizedBlock);
		if (blockData == null) {
			blockData = new HashMap<String, Object>();
			payloadByBlock.put(normalizedBlock, blockData);
		}
		blockData.put(key, value);
	}

	private String normalizeBlock(String block) {
		return block == null ? "__ROOT__" : block;
	}
}
