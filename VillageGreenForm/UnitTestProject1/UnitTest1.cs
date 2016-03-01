using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using VillageGreenConsoleApp;

namespace UnitTestProject1
{
    [TestClass]
    public class UnitTest1
    {
        [TestMethod]
        public void TestMethod1()
        {
            string attendu = "";
            string resultat;
            resultat = Program.CheckMail("jean@free.fr");
            Assert.AreEqual(attendu, resultat);
        }
    }
}
