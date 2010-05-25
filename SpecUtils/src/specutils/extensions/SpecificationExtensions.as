package specutils.extensions
{
	import flash.events.IEventDispatcher;
	import org.flexunit.assertThat;
	import org.flexunit.asserts.*;
	import org.hamcrest.collection.*;
	import org.hamcrest.core.*;
	import org.hamcrest.number.*;
	import org.hamcrest.object.*;
	import org.hamcrest.text.*;

	public class SpecificationExtensions
	{

		public function SpecificationExtensions(actual : Object) : void
		{
			_actual = actual;
		}

		private var _actual : Object;

		public function shouldEqual(expected : Object) : SpecificationExtensions
		{
			assertThat(_actual, equalTo(expected));
			return this;
		}

		public function shouldNotEqual(expected : Object) : SpecificationExtensions
		{
			assertThat(_actual, not(equalTo(expected)));
			return this;
		}

		public function shouldBeSameInstanceAs(expected : Object) : SpecificationExtensions
		{
			assertThat(_actual, sameInstance(expected));
			return this;
		}

		public function get shouldBeTrue() : SpecificationExtensions
		{
			assertTrue(_actual);
			return this;
		}

		public function get shouldBeFalse() : SpecificationExtensions
		{
			assertFalse(_actual);
			return this;
		}

		public function get shouldBeNull() : SpecificationExtensions
		{
			assertNull(_actual);
			return this;
		}

		public function get shouldNotBeNull() : SpecificationExtensions
		{
			assertNotNull(_actual);
			return this;
		}

		public function shouldHaveProperty(propertyName : String) : SpecificationExtensions
		{
			assertTrue(_actual.hasOwnProperty(propertyName));
			return this;
		}

		public function shouldBeInstanceOf(expectedType : Class) : SpecificationExtensions
		{
			assertThat(_actual, instanceOf(expectedType));
			return this;
		}

		public function shouldNotBeInstanceOf(expectedType : Class) : SpecificationExtensions
		{
			assertThat(_actual, not(instanceOf(expectedType)));
			return this;
		}

		public function shouldContain(expected : String) : SpecificationExtensions
		{
			assertThat(_actual, containsString(expected));
			return this;
		}

		public function shouldHaveItem(expected : Object) : SpecificationExtensions
		{
			assertThat(_actual, hasItem(expected));
			return this;
		}

		public function shouldHaveEventListener(expectedType : String) : SpecificationExtensions
		{
			assertTrue((_actual as IEventDispatcher).hasEventListener(expectedType));
			return this;
		}

		public function shouldBeGreaterThan(value : Number) : SpecificationExtensions
		{
			assertThat(_actual, greaterThan(value));
			return this;
		}

		public function shouldBeGreaterThanOrEqual(value : Number) : SpecificationExtensions
		{
			assertThat(_actual, greaterThanOrEqualTo(value));
			return this;
		}

		public function shouldBeLessThan(value : Number) : SpecificationExtensions
		{
			assertThat(_actual, lessThan(value));
			return this;
		}

		public function shouldBeLessThanOrEqual(value : Number) : SpecificationExtensions
		{
			assertThat(_actual, lessThanOrEqualTo(value));
			return this;
		}
	}
}