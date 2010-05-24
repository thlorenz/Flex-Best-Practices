package bddseparate.fakes
{
	import accounting.interfaces.IEmployee;

	public class EmployeeMock implements IEmployee
	{
		public var fireWasCalled : Boolean;
		public var payWasCalled : Boolean;

		private var _didGoodWork : Boolean;
		private var _salary : Number;
		private var _wasFired : Boolean;
		private var _wasPaid : Boolean;

		public function get wasPaid() : Boolean
		{
			return _wasPaid;
		}

		public function set wasPaid(value : Boolean) : void
		{
			_wasPaid = value;
		}

		public function get wasFired() : Boolean
		{
			return _wasFired;
		}

		public function set wasFired(value : Boolean) : void
		{
			_wasFired = value;
		}

		public function get salary() : Number
		{
			return _salary;
		}

		public function set salary(value : Number) : void
		{
			_salary = value;
		}

		public function get didGoodWork() : Boolean
		{
			return _didGoodWork;
		}

		public function set didGoodWork(value : Boolean) : void
		{
			_didGoodWork = value;
		}


		public function pay() : void
		{
			payWasCalled = true;
		}

		public function fire() : void
		{
			fireWasCalled = true;
		}
	}
}