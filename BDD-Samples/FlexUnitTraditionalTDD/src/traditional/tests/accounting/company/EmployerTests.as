package traditional.tests.accounting.company
{
	import accounting.company.Employer;
	import org.flexunit.asserts.*;
	import traditional.fakes.EmployeeMock;

	public class EmployerTests
	{
		private var _employee_Mock : EmployeeMock;
		private var _sut : Employer;

		[Before]
		public function setup() : void
		{
			_employee_Mock = new EmployeeMock();
			_sut = new Employer(_employee_Mock);
		}

		[Test]
		public function EmployeeDidGoodWork_EvaluateEmployee_DoesNotFireHim() : void
		{
			_employee_Mock.didGoodWork = true;

			_sut.evaluateEmployee();

			assertFalse(_employee_Mock.fireWasCalled);
		}

		[Test]
		public function EmployeeDidNoGoodWork_EvaluateEmployee_FiresHim() : void
		{
			_employee_Mock.didGoodWork = false;

			_sut.evaluateEmployee();

			assertTrue(_employee_Mock.fireWasCalled);
		}

		[Test]
		public function EmployeeWasNotFiredSalaryIsGreaterZeroAndWasNotPaid_PayEmployee_PaysHim() : void
		{
			_employee_Mock.salary = 1;

			_sut.payEmployee();

			assertTrue(_employee_Mock.payWasCalled);
		}

		[Test(expects="flash.errors.IllegalOperationError")]
		public function EmployeeWasNotFiredButSalaryIsZero_PayEmployee_ThrowsIllegalOperationError() : void
		{
			_employee_Mock.salary = 0;

			_sut.payEmployee();
		}

		[Test(expects="flash.errors.IllegalOperationError")]
		public function SalaryIsGreaterZeroButEmployeeWasFired_PayEmployee_ThrowsIllegalOperationError() : void
		{
			_employee_Mock.salary = 1;
			_employee_Mock.wasFired = true;

			_sut.payEmployee();
		}

		[Test]
		public function EmployeeWasNotFiredSalaryIsGreaterZeroButWasPaid_PayEmployee_DoesNotPayHimAgain() : void
		{
			_employee_Mock.salary = 1;
			_employee_Mock.wasPaid = true;

			_sut.payEmployee();

			assertFalse(_employee_Mock.payWasCalled);
		}
	}
}