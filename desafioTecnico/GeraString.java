package desafioTecnico;

public class GeraString {
	
	//-------------------------------------------------------------------
	//		Declaração das variaveis
	//-------------------------------------------------------------------
	private double[] lista;
	double soma = 0;
	
	int tamanhoLista = 0;
	
	String frase = " cujo valor é R$ ";
	String resultadoFinal = "Remessa gerada: ", aux = "", num = "";
	
	//-------------------------------------------------------------------
	//		Declaração do método que recebe o array de valores
	//-------------------------------------------------------------------
	
	public void setLista(double[] lista ) {
		this.lista = lista;
		tamanhoLista = lista.length;
	}
	
	//-------------------------------------------------------------------
	//		Declaração do método que faz a concatenação e a soma dos valores
	//-------------------------------------------------------------------
	
	public void concatena() {
		
		for(int x=0;x<tamanhoLista;x++) {
			
			num = String.format("%,.2f", lista[x]);
			soma += lista[x];
			aux = x+1+frase+num;
			
			if(x == (tamanhoLista -2)){
				resultadoFinal = resultadoFinal + aux + " e ";
			}
			else {
				if((x + 1) == tamanhoLista) {
					resultadoFinal = resultadoFinal + aux + ". ";				
				}
				else {			
					resultadoFinal = resultadoFinal + aux + ", ";
				}
			}
		}
		
		num = String.format("%,.2f", soma);
		resultadoFinal += "Total = " + num;
	}
	
	//-------------------------------------------------------------------
	//		Declaração do método que retorna a frase concatenada
	//-------------------------------------------------------------------
	
	public String resultado() {
		return resultadoFinal;
	}
	
}


