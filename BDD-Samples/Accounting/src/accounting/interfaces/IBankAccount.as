package accounting.interfaces
{

	public interface IBankAccount
	{
		function updateWithAmount(amount : Number) : void;

		function get isConnected() : Boolean;
	}
}