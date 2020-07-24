myfunction <- function() {
  x <- rnorm(100)
  mean(x)
}

second <- function(x) {
  x + rnorm(length(x))
}

create_vector <- function(positive) {
  if (positive == T){
    x <- 1:10
  } else {
    x <- -1:-10
  }
  "
  A seguir, serão listadas mais maneiras de se criar vetores no R.
  Vale destacar que vetores são um tipo de variável que contém apenas 1 tipo
  de subvariável por vez. Ou seja, um vetor não pode conter números e strings
  ao mesmo tempo.
  "
  
  y <- c(1,2,3,4,5,6,7,8,9,10)
  w <- vector("numeric",length = 10)
  print(x)
  print(y)
  print(w)
  
  "
  Pode-se converter os tipos de variáveis através do comando as.<tipo>(x)
  onde <tipo> é a nova classe de variável que deseja-se gerar. x é a variável
  que deseja-se converter.
  "
  print(class(y))
  print(as.logical(y))
  print(class(as.logical(y)))
  print(as.character(y))
  print(class(as.character(y)))
  
  "
  Listas: as listas são um tipo especial de vetores, que podem conter tipos de
  variáveis diferentes. A maneira como as variáveis internas da lista são prin
  tadas coluna a coluna. Onde as colunas aparecem entre [[]] e as linhas entre
  [].
  "
  print(list(1,"a",T,1+4i))
  
  "
  Matrizes são vetores em 2 dimensões. Ao passar um vetor para o preenchimento
  de uma matriz, o processo será feito por colunas.
  
  Também é possível transformar vetores unidimensionais em matrizes por meio da
  inserção de uma dimensão adicional nele. As dimensões de vetores também são
  tratadas como vetores, logo, é possível manipulá-las diretamente.
  
  Outro modo de criar matrizes é por meio da concatenação de vetores. 
  Os comandos para tal são rbind(x,y) para concatenar os vetores em linhas e
  cbind(x,y) para concatená-los em colunas.
  "
  m <- matrix(1:6,nrow = 2, ncol = 3)
  print(m)
  print(dim(m))
  print(attributes(m))
  
  m2 <- 1:10
  dim(m2) <- c(2,5)
  print(m2)
  
  x3 <- 1:5
  y3 <- 6:10
  print(rbind(x3,y3))
  print(cbind(x3,y3))
  
  "
  Fatores: fatores são um tipo especial de objeto que contém vetores categóricos
  em seu interior. Tais vetores podem ser ordenados ou não. Sua grande diferen
  ça para os vetores convencionais, ou para as listas, é que eles possuem algu-
  mas funções específicas que auxiliam no manejo das informações inseridas ne-
  les.
  
  Fatores possuem o 'Level' um de seus atributos principais. Os leveis são, basi
  camente, a quantidade de categorias que existem no vetor inserido no fator.
  Ao criar um fator, a ordem dos leveis pode ser dada ou omitida. Caso seja omi
  tida, a ordem dos fatores será determinada de acordo com a ordem alfabetica
  dos leveis.
  "
  fac <- factor(c('yes','no','no','yes','yes'))
  print(fac)
  print(table(fac))
  print(unclass(fac))
  fac2 <- factor(c('yes','no','no','yes','yes'),levels = c('yes','no'))
  print(fac2)
  
  "
  Valores faltantes: os valores faltantes são denominados NA ou NaN para opera-
  ções matemáticas indefinidas. Vale destacar que os valores NA possuem classes,
  ou seja, é possível ter um NA inteiro, um caractere NA, etc. Por último, um
  NaN é também um NA, porém a conversão de um em outro não é valida.
  
  is.na() testa objetos para NA
  is.nan() testa objetos para NaN
  
  Ao final, conclui-se que um NaN é um NA, mas um NA não é um NaN.
  "
  nan_vec <- c(1,2,NA,10,3)
  print(nan_vec)
  print(is.na(nan_vec))
  nan_vec2 <- c(1,NaN,NA,10,3)
  print(nan_vec2)
  print(is.na(nan_vec2))
  print(is.nan(nan_vec2))
  
  "
  Dataframes: são uma estrutura tabular que organiza dados que podem ser de
  classes diferentes. Os comandos usuais para gerar um df são:
    read.table()
  read.csv()
  data.frame(namecolumn=vector,namecolumn2=vector2,...,namecolumn n = vectorn)
  
  Dataframes possuem um atributo especial chamado row.names, que lista os nomes
  de todas as linhas do df.
  
  Finalmente, dataframes podem ser convertidos integralmente em matrizes, porém
  os dados serão convertidos para uma mesma classe, podendo gerar resultados não
  desejados.
  
  ""
    
    Nomes: objetos em R possuem nomes. Para vetores, pode-se associar nomes a cada
  um de seus elementos. Para tal, basta atribuir aos nomes do vetor desejado, um
  vetor de nomes: names(x) <- c('a','b,'c'), se x for um vetor de 3 elementos.
  
  Para uma lista, pode-se atribuir os nomes dos elementos diretamente em sua
  criação:
  x <- list(a=1,b=2,c=3)
  
  Finalmente, para matrizes, pode-se atribuir, assim como feito nos vetores,
  os nomes de cada um dos elementos ao vetor de nomes do objeto:
  dimnames(m) <- list(c('a','b'),c('c','d')) Onde o primeiro vetor se refere às
  linhas e o segundo, às colunas.
  ""
  Lendo dados:
  Principais: read.table() e read.csv() retornam um dataframe
  readLines leem arquivos de texto
  source leem arquivos .R
  dget leem arquivos .R (parsed)
  load para ler workspaces
  unserialize para ler um objeto binário
  
  Salvando dados:
  write.table()
  write.Lines
  dump
  dput
  save
  serialize
  "
  "
  Ler grande quantidade de dados:
  ler a tela de ajuda do read.table
  realizar um calculo grosseiro da memória requirida para estocar os dados. Se
  os dados forem maiores do que a quantidade de dados na memória RAM, é melhor
  encerrar o processo.
  Setar comment.char = '' se nao tiver linhas comentadas no arquivo
  usar o colClasses nos argumentos da função irá poupar tempo do R procurando
  o tipo de dado que se trata cada coluna do arquivo.
  
  Digamos que você tenha um arquivo que contém milhares de linhas e você não sa
  be o tipo de dado de cada coluna. Um modo rápido de identificar seria:
  
  initial <- read.table('database.txt',nrows=100)
  classes <- sapply(initial,class)
  tabAll <- read.table('database.txt',colClasses = classes)
  
  Desse modo, pode-se identificar rapidamente o tipo de dado de cada classe atra
  vés do R e, em seguida, utilizar tais classes para ler de fato o arquivo intei
  ro. Este procedimento, para arquivos grandes, costuma poupar metade do tempo
  gasto caso as classes não fossem dadas na função.
  
  (um dado numérico utiliza cerca de 8 bytes, 1MB=2^20 bytes) Em geral, é neces
  sário ter no computador 2x a memória utilizada para ler o arquivo.
  "
  "
  Formatos de texto:
  dumping and dputing são maneiras de criar arquivos de texto editáveis prove
  nientes de dataframes. Seu ponto positivo é que as informações acerca do tipo 
  de dado que existe em cada coluna é preservado. Desse modo, pode-se utilizar 
  essa informação ao reconstruir os dados. Exemplo abaixo:

  "

  data <- data.frame(a=1,b="a")
  data2 <- data.frame(c=2,d='sda')
  dput(data,file('data.R'))
  new.data = dget('data.R')
  dump(c('data','data2'),file='data2.R')
  
  "
  Conexões com o mundo externo:
  file: abre a conexão com um arquivo
  gzfile: abre uma conexão com um arquivo comprimido através do gzip
  bzfile: abre uma conexão com um arquivo comprimido através do bzip2
  url: abre uma conexão com alguma página web
  
  con <- gzfile('words.gz')
  x <- readLines(con,10)
  x
  "
  
  "
  Subsets:
  
  [ : sempre retorna a mesma classe do objeto original, pode ser usado para sele
  cionar mais de um elemento (há uma exceção).
  
  [[ : utilizado para extraor elementos de listas ou dataframes. Somente pode
  ser utilizado para extrair um único elemento e a classe do elemento não é ne
  cessariamente igual a uma lista ou df.
  
  $ : é usado para extrair elementos de uma lista ou df por nome, as semânticas
  são similares
  
  Supondo que x seja uma lista que contém, em sua primeira posição, um vetor de
  números. Ao utilizarmos x[1] teremos, como resposta, o primeiro elemento da
  lista - o vetor mencionado. Porém, caso utilizemos x[[1]], então a resposta
  será apenas o conteúdo do vetor.
  
  Finalmente, a vantagem de utilizar x$name está em encontrar o elemento sem ter
  a informação exata de sua posição. Vale ressaltar que variáveis não podem ser
  utilizadas para encontrar os elementos através de $. O nome que é utilizado em
  $ não precisa ser necessariamente o nome do elemento que você está procurando.
  Por exemplo, casa um elemento tenha como nome a palavra 'abc', ao utilizar o
  comando x$a, teremos como resposta esse elemento caso não haja outros elemen
  tos cujos nomes começam pela letra 'a'.
  "
  
  "
  Valores faltantes:
  
  good <- complete.cases(x) onde x pode ser uma lista, vetor ou df. Esse coman
  do devolve uma lista, vetor ou df booleano, contendo T para valores não fal
  tantes e F para faltantes. A seguir, pode-se utilizar os subsets acima para
  retirar os valores faltantes.
  "
  
  "
  Operações vetorizadas:
  São operações que envolvem vetores, listas e matrizes e são conhecidas por
  serem mais eficientes. Para utilizá-las basta utilizar os operadores mate-
  máticos nos objetos citados como se fossem números comuns.
  
  Vale ressaltar que a operação de multiplicação de matrizes (real) é dada pelo
  operador %*%.
  "
  
  
}