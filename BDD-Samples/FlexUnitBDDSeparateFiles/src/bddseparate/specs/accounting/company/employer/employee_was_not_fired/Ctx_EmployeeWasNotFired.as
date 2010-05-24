package bddseparate.specs.accounting.company.employer.employee_was_not_fired
{
	import bddseparate.specs.accounting.company.employer.EmployerSpecs;

	public class Ctx_EmployeeWasNotFired extends EmployerSpecs
	{
		override protected function context() : void
		{
			super.context();
			_employee_Mock.wasFired = false;
		}
	}
}