package bddseparate.specs.accounting.company.employer.when_employee_did_no_good_work
{
	import bddseparate.specs.accounting.company.employer.EmployerSpecs;

	public class and_we_evaluate_him extends EmployerSpecs
	{
		override protected function context() : void
		{
			super.context();
			_employee_Mock.didGoodWork = false;
		}

		override protected function because() : void
		{
			_sut.evaluateEmployee();
		}

		[Test]
		public function he_should_get_fired() : void
		{
			the(_employee_Mock.fireWasCalled).shouldBeTrue;
		}
	}
}