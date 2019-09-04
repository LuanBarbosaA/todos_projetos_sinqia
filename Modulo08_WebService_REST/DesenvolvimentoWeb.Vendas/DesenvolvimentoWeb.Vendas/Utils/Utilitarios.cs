using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;

namespace DesenvolvimentoWeb.Vendas.Utils
{
	public class Utilitarios
	{
		public static string GetMd5Hash(string texto)
		{
			MD5 md5 = MD5.Create();
			byte[] data = md5.ComputeHash(Encoding.UTF8.GetBytes(texto));
			StringBuilder buider = new StringBuilder();

			for (int i = 0; i < data.Length; i++)
			{
				buider.Append(data[i].ToString("x2"));
			}
			return buider.ToString();
		}
	}
}