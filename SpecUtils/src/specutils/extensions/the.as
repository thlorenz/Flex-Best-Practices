package specutils.extensions
{

	public function the(actual : Object) : SpecificationExtensions
	{
		return new SpecificationExtensions(actual);
	}
}