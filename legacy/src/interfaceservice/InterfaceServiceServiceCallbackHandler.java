package interfaceservice;

public abstract class InterfaceServiceServiceCallbackHandler {
	protected Object clientData;

	public InterfaceServiceServiceCallbackHandler(Object clientData) {
		this.clientData = clientData;
	}

	public InterfaceServiceServiceCallbackHandler() {
		this.clientData = null;
	}

	public Object getClientData() {
		return clientData;
	}

	public void receiveResultssoTicketValidate(InterfaceServiceServiceStub.SsoTicketValidateResponse result) {
	}

	public void receiveErrorssoTicketValidate(Exception e) {
	}
}
