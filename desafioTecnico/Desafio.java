package desafioTecnico;

public class Desafio {

	public static void main(String[] args) {
		
		//-------------------------------------------------------------------
		//	Declaração do array e variaveis
		//-------------------------------------------------------------------
		
		double[] lista = {88.00, 130.00, 54.90, 293.30, 44.80};
		String resultado = "";
		
		//-------------------------------------------------------------------
		// Instancia a classe GeraString
		//-------------------------------------------------------------------

		GeraString geraString = new GeraString();
		
		//-------------------------------------------------------------------
		//	Chamada dos métodos na classe GeraString
		//-------------------------------------------------------------------
		
		geraString.setLista(lista);
		geraString.concatena();
		resultado = geraString.resultado();
		
		//-------------------------------------------------------------------
		//	Mostra o resultado no console
		//-------------------------------------------------------------------
		
		System.out.println(resultado);
		
		
	}		
}


