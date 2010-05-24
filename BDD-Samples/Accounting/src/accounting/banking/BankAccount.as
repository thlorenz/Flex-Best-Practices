package accounting.banking
{
	import accounting.interfaces.IBankAccount;

	public class BankAccount implements IBankAccount
	{
		public function updateWithAmount(amount : Number) : void
		{
			// in a real world we would need to be connected to some real bank account here and do a transaction
			// obviously in a test we want to avoid this, hence we need an interface and a mock implementing the interface as well
			// in order to swap it out for the real thing 
		}

		public function get isConnected() : Boolean
		{
			// in a real world the connection status would be determined here

			return false;
		}
	}
}