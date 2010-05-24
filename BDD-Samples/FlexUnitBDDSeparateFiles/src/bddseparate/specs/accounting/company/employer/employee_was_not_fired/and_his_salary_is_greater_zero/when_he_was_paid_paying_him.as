package bddseparate.specs.accounting.company.employer.employee_was_not_fired.and_his_salary_is_greater_zero
{
	import bddseparate.specs.accounting.company.employer.employee_was_not_fired.Ctx_EmployeeWasNotFired;

	public class when_he_was_paid_paying_him extends Ctx_EmployeeWasNotFired
	{
		override protected function context() : void
		{
			super.context();
			_employee_Mock.wasPaid = true;
			_employee_Mock.salary = 1;
		}

		override protected function because() : void
		{
			_sut.payEmployee();
		}

		[Test]
		public function should_not_pay_him_again() : void
		{
			the(_employee_Mock.payWasCalled).shouldBeFalse;
		}
	}
}