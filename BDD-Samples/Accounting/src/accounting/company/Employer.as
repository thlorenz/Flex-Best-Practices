package accounting.company
{
	import flash.errors.IllegalOperationError;
	import accounting.interfaces.IEmployee;
	import accounting.interfaces.IEmployer;

	public class Employer implements IEmployer
	{

		public function Employer(employee : IEmployee)
		{
			_employee = employee;
		}

		private var _employee : IEmployee;

		public function payEmployee() : void
		{
			validateThatEmployeeIsEligibleToGetPaid()

			if (!_employee.wasPaid)
				_employee.pay();
		}

		public function evaluateEmployee() : void
		{
			if (!_employee.didGoodWork)
				_employee.fire();
		}

		private function validateThatEmployeeIsEligibleToGetPaid() : void
		{
			if (_employee.salary <= 0)
				throw new IllegalOperationError("salary must be greater 0!");
			if (_employee.wasFired)
				throw new IllegalOperationError("cannot pay a no good sob that we fired!");
		}
	}
}