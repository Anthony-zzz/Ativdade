class Usuario:
    def __init__(self, nome, email, senha):
        self.nome = nome
        self.email = email
        self.senha = senha

    def exibir_dados(self):
        print(f'Nome: {self.nome}')
        print(f'Email: {self.email}')


class Administrador(Usuario):
    def __init__(self, nome, email, senha):
        super().__init__(nome, email, senha)
        self.permissoes = []

    def adicionar_permissao(self, permissao):
        self.permissoes.append(permissao)

    def exibir_dados(self):
        super().exibir_dados()
        print(f'Permissões: {", ".join(self.permissoes)}')


def cadastrar_usuario():
    nome = input('Digite o nome do usuário: ')
    email = input('Digite o email do usuário: ')
    senha = input('Digite a senha do usuário: ')
    return Usuario(nome, email, senha)


def cadastrar_administrador():
    nome = input('Digite o nome do administrador: ')
    email = input('Digite o email do administrador: ')
    senha = input('Digite a senha do administrador: ')
    admin = Administrador(nome, email, senha)
    while True:
        permissao = input('Digite uma permissão (ou "sair" para terminar): ')
        if permissao.lower() == 'sair':
            break
        admin.adicionar_permissao(permissao)
    return admin


def exibir_menu():
    print("1. Cadastrar Usuário")
    print("2. Cadastrar Administrador")
    print("3. Exibir Usuários")
    print("4. Exibir Administradores")
    print("5. Sair")


def main():
    usuarios = []
    administradores = []

    while True:
        exibir_menu()
        opcao = int(input('Escolha uma opção: '))

        if opcao == 1:
            usuario = cadastrar_usuario()
            usuarios.append(usuario)
        elif opcao == 2:
            administrador = cadastrar_administrador()
            administradores.append(administrador)
        elif opcao == 3:
            print("Usuários cadastrados:")
            for usuario in usuarios:
                usuario.exibir_dados()
        elif opcao == 4:
            print("Administradores cadastrados:")
            for administrador in administradores:
                administrador.exibir_dados()
        elif opcao == 5:
            break
        else:
            print("Opção inválida!")


if __name__ == "__main__":
    main()
