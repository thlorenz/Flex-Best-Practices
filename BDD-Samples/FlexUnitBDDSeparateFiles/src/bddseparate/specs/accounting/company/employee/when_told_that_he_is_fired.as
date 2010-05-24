package bddseparate.specs.accounting.company.employee
{

	public class when_told_that_he_is_fired extends EmployeeSpecs
	{
		override protected function because() : void
		{
			_sut.fire();
		}

		[Test]
		public function was_fired_should_be_true() : void
		{
			the(_sut).shouldBeTrue;
		}
	}
}