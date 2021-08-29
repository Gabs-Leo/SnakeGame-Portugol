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

	//Snake
	inteiro snakeHead = g.carregar_imagem("src/snake_head.png")
	logico direita = falso,
		esquerda = falso,
		cima = falso,
		baixo = falso
	inteiro xSnakeHead = (WINDOW_WIDTH*WINDOW_SCALE)/2
	inteiro ySnakeHead = (WINDOW_HEIGHT*WINDOW_SCALE)/2
	inteiro delay = 100
	inteiro speed = 5

	inteiro xSnakeTail 
	inteiro ySnakeTail 

	//Food
	inteiro foodSprite = g.carregar_imagem("src/food.png")
	inteiro xFoodPos[14] = {80, 160, 240, 320, 400, 480, 560, 640, 720, 800, 880, 960, 1040, 1120},
		yFoodPos[9] = {160, 240, 320, 400, 480, 560, 640, 720, 800}
	inteiro xFood = 300
	inteiro yFood = 300
	
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
			snakeDirection()
			moveSnake()
			restartGame()
			
			drawSnakeHead()
			drawFood()
			spawnFood()
			
			g.renderizar()
			util.aguarde(delay)
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

	//Snake Head
	funcao drawSnakeHead(){
		g.desenhar_imagem(xSnakeHead - g.largura_imagem(snakeHead)/2, ySnakeHead - g.altura_imagem(snakeHead)/2, snakeHead)
	}

	//Direction
	funcao snakeDirection(){
		se (kb.tecla_pressionada(kb.TECLA_SETA_DIREITA)){
			direita = verdadeiro
			esquerda = falso
			baixo = falso
			cima = falso
		}senao se(kb.tecla_pressionada(kb.TECLA_SETA_ESQUERDA)){
			esquerda = verdadeiro
			direita = falso
			baixo = falso
			cima = falso
		}
		se(kb.tecla_pressionada(kb.TECLA_SETA_ACIMA)){
			cima = verdadeiro
			direita = falso
			baixo = falso
			esquerda = falso
		}senao se(kb.tecla_pressionada(kb.TECLA_SETA_ABAIXO)){
			baixo = verdadeiro
			direita = falso
			cima = falso
			esquerda = falso
		}
	}

	//Moving Snake
	funcao moveSnake(){
		se (direita){
			xSnakeHead += speed*WINDOW_SCALE
			g.liberar_imagem(snakeHead)
			snakeHead = g.carregar_imagem("src/snake_head_right.png")
			escreva("\n" + xSnakeHead)
			
		}senao se(esquerda){
			xSnakeHead -= speed*WINDOW_SCALE
			g.liberar_imagem(snakeHead)
			snakeHead = g.carregar_imagem("src/snake_head_left.png")
			escreva("\n" + xSnakeHead)
		}
		se(cima){
			ySnakeHead -= speed*WINDOW_SCALE
			g.liberar_imagem(snakeHead)
			snakeHead = g.carregar_imagem("src/snake_head.png")
			escreva("\n" + ySnakeHead)
		}senao se(baixo){
			ySnakeHead += speed*WINDOW_SCALE
			g.liberar_imagem(snakeHead)
			snakeHead = g.carregar_imagem("src/snake_head_down.png")
			escreva("\n" + ySnakeHead)
		}
	}

	//Did it collide?
	funcao logico wallCollide(){
		se(xSnakeHead > WINDOW_WIDTH*WINDOW_SCALE ou xSnakeHead < 0){
			retorne verdadeiro
		}senao se(ySnakeHead > WINDOW_HEIGHT*WINDOW_SCALE ou ySnakeHead < 0 + 10*WINDOW_SCALE){
			retorne verdadeiro
		}
		retorne falso
	}

	//Restart
	funcao restartGame(){
		se(wallCollide()){
			xSnakeHead = (WINDOW_WIDTH*WINDOW_SCALE)/2
			ySnakeHead = (WINDOW_HEIGHT*WINDOW_SCALE)/2
			cima = falso
			direita = falso
			baixo = falso
			esquerda = falso
		}
	}

	//Eating
	funcao logico snakeEat(){
		se(xSnakeHead > xFood e xSnakeHead < xFood + 80 e ySnakeHead > yFood e ySnakeHead < yFood + 80){
			retorne verdadeiro
		}senao{
			retorne falso
		}
	}

	//Spawn Food
	funcao spawnFood(){
		inteiro xIndex = util.sorteia(0, 13)
		inteiro yIndex = util.sorteia(0, 8)
		se(snakeEat()){
			xFood = xFoodPos[xIndex]
			yFood = yFoodPos[yIndex]
		}
	}

	//Draw Food
	funcao drawFood(){
		g.desenhar_imagem(xFood, yFood, foodSprite)
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1078; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */