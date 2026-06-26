package interfaceservice;

public class InterfaceServiceServiceStub {
	public InterfaceServiceServiceStub() {
	}

	public InterfaceServiceServiceStub(String targetEndpoint) {
	}

	public SsoTicketValidateResponse ssoTicketValidate(SsoTicketValidate request) {
		SsoTicketValidateResponse response = new SsoTicketValidateResponse();
		response.setSsoTicketValidateReturn("stub:false");
		return response;
	}

	public static class SsoTicketValidate {
		private String xml;

		public String getXml() {
			return xml;
		}

		public void setXml(String xml) {
			this.xml = xml;
		}
	}

	public static class SsoTicketValidateResponse {
		private String ssoTicketValidateReturn;

		public String getSsoTicketValidateReturn() {
			return ssoTicketValidateReturn;
		}

		public void setSsoTicketValidateReturn(String ssoTicketValidateReturn) {
			this.ssoTicketValidateReturn = ssoTicketValidateReturn;
		}
	}
}
