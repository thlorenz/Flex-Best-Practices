package bddseparate.specs.accounting.company.employer.employee_was_fired
{
	import bddseparate.specs.accounting.company.employer.EmployerSpecs;

	import flash.errors.IllegalOperationError;

	public class paying_him extends EmployerSpecs
	{
		override protected function context() : void
		{
			super.context();
			_employee_Mock.wasFired = true;
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