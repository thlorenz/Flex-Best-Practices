package bddseparate.specs.accounting.company.employer.employee_was_not_fired.but_his_salary_is_zero
{
	import bddseparate.specs.accounting.company.employer.employee_was_not_fired.Ctx_EmployeeWasNotFired;

	import flash.errors.IllegalOperationError;

	public class paying_him extends Ctx_EmployeeWasNotFired
	{
		override protected function context() : void
		{
			super.context();
			_employee_Mock.salary = 0;
		}

		override protected function because() : void
		{
			catchError(function() : void
				{
					_sut.payEmployee()
				});
		}

		[Test]
		public function should_throw_an_IllegalOperationException() : void
		{
			the(caughtError).shouldBeInstanceOf(IllegalOperationError);
		}

	}
}