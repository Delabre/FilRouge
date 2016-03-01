using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace VillageGreenConsoleApp
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Entrez votre adresse email");
            string adresseEmail = Console.ReadLine();

            Console.WriteLine(CheckMail(adresseEmail)); 
        }


/// <summary>
/// Methode pour valider une adresse email
/// </summary>
/// <param name="eMail"></param>
/// <returns></returns>
        static string CheckMail(string eMail)
        {
            string result = "";
            if (Regex.IsMatch(eMail, @"^(\w){2,}\@(\w){2,}\.[a-z]{2,}$"))
            {
                result = "";
            }
            else if (Regex.IsMatch(eMail, @"^(\w){1}\@(\w){2,}\.[a-z]{2,}$"))
            {
                result = "L'adresse doit comporter au moins deux caractères devant @";
            }
            else if (Regex.IsMatch(eMail, @"^(\w){2,}\@(\w){1}\.[a-z]{2,}$"))
            {
                result = "L'adresse doit comporter au moins deux caractères après @ ";
            }
            else if (Regex.IsMatch(eMail, @"^(\w){1}\@(\w){1}\.[a-z]{2,}$"))
            {
                result = "L'adresse doit comporter au moins deux caractères devant et après @ ";
            }
            else if (Regex.IsMatch(eMail, @"^(\w){2,}\@(\w){2,}$"))
            {
                result = "L'adresse doit comporter au moins un point dans la partie qui suit @";
            }
            else if (Regex.IsMatch(eMail, @"^(\w){2,}\@(\w){2,}\.[a-z]{1}$"))
            {
                result = "L'adresse doit comporter après le point au moins deux caractères";
            }
            else
            {
                result = "Adresse email invalide";
            }
            return result;
        }
    }
}
