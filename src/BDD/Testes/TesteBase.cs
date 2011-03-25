using NUnit.Framework;

namespace Testes
{
    [TestFixture]
    public abstract class TesteBase
    {
        [SetUp]
        public void ArrangeAct()
        {
            Arrange();
            Act();
        }
        protected virtual void Arrange()
        {
            
        }
        protected abstract void Act();
    }
}