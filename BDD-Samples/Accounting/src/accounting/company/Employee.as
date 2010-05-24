package accounting.company
{
	import accounting.interfaces.IBankAccount;
	import accounting.interfaces.IEmployee;

	public class Employee implements IEmployee
	{

		public function Employee(bankAccount : IBankAccount)
		{
			_bankAccount = bankAccount;
			_salary = 0;

		}

		private var _bankAccount : IBankAccount;
		private var _didGoodWork : Boolean;
		private var _salary : Number;
		private var _wasFired : Boolean;
		private var _wasPaid : Boolean;

		public function get didGoodWork() : Boolean
		{
			return _didGoodWork;
		}

		public function set didGoodWork(value : Boolean) : void
		{
			_didGoodWork = value;
		}

		public function set salary(value : Number) : void
		{
			_salary = value;
		}

		public function get salary() : Number
		{
			return _salary;
		}

		public function get wasPaid() : Boolean
		{
			return _wasPaid;
		}

		public function get wasFired() : Boolean
		{
			return _wasFired;
		}

		public function pay() : void
		{
			if (_bankAccount.isConnected)
			{
				_bankAccount.updateWithAmount(_salary);
				_wasPaid = true;
			}
			else
				_wasPaid = false;
		}

		public function fire() : void
		{
			_wasFired = true;
		}
	}
}