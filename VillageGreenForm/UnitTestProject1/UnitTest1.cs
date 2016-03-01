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
        [TestMethod]
        public void TestMethod2()
        {
            string attendu = "L'adresse doit comporter au moins deux caractères devant @";
            string resultat;
            resultat = Program.CheckMail("j@free.fr");
            Assert.AreEqual(attendu, resultat);
        }
        [TestMethod]
        public void TestMethod3()
        {
            string attendu = "L'adresse doit comporter au moins deux caractères après @";
            string resultat;
            resultat = Program.CheckMail("jean@f.fr");
            Assert.AreEqual(attendu, resultat);
        }
        [TestMethod]
        public void TestMethod4()
        {
            string attendu = "L'adresse doit comporter au moins deux caractères devant et après @";
            string resultat;
            resultat = Program.CheckMail("j@f.fr");
            Assert.AreEqual(attendu, resultat);
        }
        [TestMethod]
        public void TestMethod5()
        {
            string attendu = "L'adresse doit comporter après le point au moins deux caractères";
            string resultat;
            resultat = Program.CheckMail("jean@free.f");
            Assert.AreEqual(attendu, resultat);
        }
    }
}
