package bddseparate.fakes
{
	import accounting.interfaces.IBankAccount;

	/**
	 * This class is just keeping track of what is done to it.
	 * It will be injected instead of the real thing and afterwards I can check if the System under Test
	 * interacted with it in the desired way.
	 * e.g. did it tell the BankAccount to update with the correct amount.
	 *
	 * @author tlorenz
	 *
	 */
	public class BankAccountMock implements IBankAccount
	{

		public var updateWithAmountWasCalled : Boolean;
		public var updateWithAmountWasCalledWith : Number;
		private var _isConnected : Boolean;

		public function updateWithAmount(amount : Number) : void
		{
			updateWithAmountWasCalled = true;
			updateWithAmountWasCalledWith = amount;
		}

		public function get isConnected() : Boolean
		{
			return _isConnected;
		}

		public function set isConnected(value : Boolean) : void
		{
			_isConnected = value;
		}
	}
}