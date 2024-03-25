# Use a versão mais recente do Ruby
FROM ruby:3.3.0

# Instale as dependências do sistema
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

# Configure a pasta de trabalho
WORKDIR /app

# Copie o Gemfile e o Gemfile.lock para o contêiner
COPY Gemfile Gemfile.lock ./

# Instale as gemas
RUN bundle install

# Copie o código do aplicativo para o contêiner
COPY . .

# Exponha a porta 3000
EXPOSE 3000

# Inicie o servidor Rails quando o contêiner for iniciado
CMD ["rails", "server", "-b", "0.0.0.0"]