package accounting.interfaces
{

	public interface IEmployee
	{
		function get salary() : Number;
		function set salary(value : Number) : void


		function get wasPaid() : Boolean;
		function get wasFired() : Boolean;
		
		function get didGoodWork() : Boolean;
		function set didGoodWork(value : Boolean) : void;

		function pay() : void;
		function fire() : void;
	}
}