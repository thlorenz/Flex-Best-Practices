package bddseparate.specs.accounting.company.employee
{

	public class initially extends EmployeeSpecs
	{

		[Test]
		public function wasPaid_should_be_false() : void
		{
			the(_sut.wasPaid).shouldBeFalse;
		}

		[Test]
		public function wasFired_should_be_false() : void
		{
			the(_sut.wasFired).shouldBeFalse;
		}

		[Test]
		public function salary_should_be_zero() : void
		{
			the(_sut.salary).shouldEqual(0);
		}
	}
}