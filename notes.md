# Criação das tabelas usando
    mix ecto.gen.migration create_users_table
    Ecto é a lib que controla o banco

    Na criação do arquivo da migration, o ecto coloca o timestamp da criação do arquivo
    É assim que ele sabe a ordem de carregamento delas

Na função change, o Ecto já deixa preparado para fazer rollback no conteúdo

# Gerando as tabelas
    mix ecto.migrate

# Desfazendo as alterações
    mix ecto.reset

# Para obter ajuda sobre os componentes do Elixir
    Exemplo: h Ecto.ChangeSet