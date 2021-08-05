programa{
	//Incluindo Bibliotecas
	inclua biblioteca Graficos --> g
	inclua biblioteca Teclado --> kb
	inclua biblioteca Util --> util

	//Screen
	const inteiro WINDOW_WIDTH = 160
	const inteiro WINDOW_HEIGHT = 90
	const inteiro WINDOW_SCALE = 8

	//Colors
	const inteiro bgColor = 0x70db9d
	const inteiro hudColor = 0x141414
	const inteiro textColor = 0xFFFFFF

	//Size
	const real textSize = 6.0

	//Mechanics
	inteiro points = 0

	//Main
	funcao inicio(){
		startScreen()
		eventTick()

	}

	//Start Screen
	funcao startScreen(){
		g.iniciar_modo_grafico(verdadeiro)
		g.definir_dimensoes_janela(WINDOW_WIDTH*WINDOW_SCALE, WINDOW_HEIGHT*WINDOW_SCALE)
		g.definir_titulo_janela("Snake Game")
	}

	//Event Tick
	funcao eventTick(){
		enquanto(verdadeiro){
			paintScreen()
			drawHUD()
			g.renderizar()
		}	
	}

	//Paint Screen
	funcao paintScreen(){
		g.definir_cor(bgColor)
		g.limpar()
	}

	//HUD
	funcao drawHUD(){
		g.definir_cor(hudColor)
		g.desenhar_retangulo(0, 0, WINDOW_WIDTH*WINDOW_SCALE, 10*WINDOW_SCALE, falso, verdadeiro)
		g.definir_cor(textColor)
		g.definir_tamanho_texto(textSize*WINDOW_SCALE)
		g.desenhar_texto(2*WINDOW_SCALE, 2*WINDOW_SCALE, "Pontuação Atual: " + points)
	}

	//Snake
	funcao drawSnakeHead(){
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1234; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */