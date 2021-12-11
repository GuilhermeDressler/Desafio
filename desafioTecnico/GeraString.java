package desafioTecnico;

public class GeraString {
	
	//-------------------------------------------------------------------
	//		Declara��o das variaveis
	//-------------------------------------------------------------------
	private double[] lista;
	double soma = 0;
	
	int tamanhoLista = 0;
	
	String frase = " cujo valor � R$ ";
	String resultadoFinal = "Remessa gerada: ", aux = "", num = "";
	
	//-------------------------------------------------------------------
	//		Declara��o do m�todo que recebe o array de valores
	//-------------------------------------------------------------------
	
	public void setLista(double[] lista ) {
		this.lista = lista;
		tamanhoLista = lista.length;
	}
	
	//-------------------------------------------------------------------
	//		Declara��o do m�todo que faz a concatena��o e a soma dos valores
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
	//		Declara��o do m�todo que retorna a frase concatenada
	//-------------------------------------------------------------------
	
	public String resultado() {
		return resultadoFinal;
	}
	
}


