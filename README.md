**Idioma**: 🇧🇷 <a href="https://github.com/AndreDrummer/Tiutiu/blob/main/readme.md">Português Brasileiro</a> | 🇺🇸 <a href="https://github.com/AndreDrummer/Tiutiu/blob/main/readme-en-us.md">Inglês Americano</a>

# <img src="assets/icon/round_icon.png" alt="Logo" width="64" style="vertical-align: middle;"/> Tasky - Gerenciador de Tarefas

### Simples gerenciador de tarefas para Android e iOS 📝

<table>  
  <tr>    
    <td><img src="assets/repo/unlogged-initial-screen-no-task.png" alt="Apresentação do App 10" width="200"/></td>     
    <td><img src="assets/repo/unlogged-create-task.png" alt="Apresentação do App 5" width="200"/></td>     
    <td><img src="assets/repo/unlogged-search.png" alt="Apresentação do App 14" width="200"/></td>     
    <td><img src="assets/repo/unlogged-done.png" alt="Apresentação do App 8" width="200"/></td>                                          
  </tr>  
</table>


<table>  
  <tr>        
    <td><img src="assets/repo/unlogged-creating-task.png" alt="Apresentação do App 6" width="200"/></td>   
    <td><img src="assets/repo/unlogged-initial-screen-with-tasks.png" alt="Apresentação do App 11" width="200"/></td>        
    <td><img src="assets/repo/unlogged-search-found.png" alt="Apresentação do App 13" width="200"/></td>   
    <td><img src="assets/repo/unlogged-done-with-tasks.png" alt="Apresentação do App 7" width="200"/></td>           
  </tr>  
</table>

<table>  
  <tr>    
    <td><img src="assets/repo/unlogged-menu-open.png" alt="Apresentação do App 12" width="200"/></td>       
    <td><img src="assets/repo/auth-screen.png" alt="Apresentação do App 1" width="200"/></td>                
    <td><img src="assets/repo/profile.png" alt="Apresentação do App 4" width="200"/></td>    
    <td><img src="assets/repo/logged-initial-screen.png" alt="Apresentação do App 3" width="200"/></td>                    
  </tr>  
</table>

O **Tiu, Tiu** é um aplicativo poderoso e intuitivo criado para facilitar o processo de adoção e doação de animais. Com uma série de funcionalidades robustas, nossa missão é conectar adotantes e doadores, garantindo que mais animais encontrem lares amorosos. Além disso, proporcionamos uma experiência de uso moderna, com vídeos, geolocalização, chat integrado e muito mais!

---

## 🛠️ Como Configurar e Executar

Para executar o aplicativo, siga estas etapas:

1. Configure Flutter na sua máquina, se ainda não estiver configurado.
    Acesse [flutter.dev](https://flutter.dev).

2. Clone o repositório:
```bash
git clone https://github.com/andresilva/tasky.git
```

3. Instale as dependências:
```bash
flutter pub get
```

4. Execute o aplicativo:
```bash
flutter run
```

---
## 🏗️ Arquitetura MVVM
O aplicativo segue a arquitetura MVVM (Model-View-ViewModel) para uma estrutura de código organizada e escalável.
| Feature Tasks                          | Feature Language                 | Feature Auth                    |
| -------------------------------------- | -------------------------------- | ------------------------------- |
| ![Tela Inicial](/assets/repo/mvvm.png) | ![Criar](/assets/repo/mvvm2.png) | ![Done](/assets/repo/mvvm3.png) |


---

## 🏗️ Testes Automatizados
O aplicativo possui testes automatizados de unidade, interface e integração para garantir a qualidade do código. Para executar os testes, execute o seguinte comando na raiz do projeto:

- Testes de unidade:

```bash
flutter test test/unit_test.dart
```

- Testes de interface:
```bash
flutter test test/widgets_test.dart
```

- Testes de integração:
```bash
flutter test integration_test/app_test.dart
```

## Cobertura de código LCOV: 95,4% (linhas de código)
Utilizando a ferramenta de cobertura de código LCOV,podemos visualizar a porcentagem de cobertura de código do aplicativo.
Para visualizar a cobertura de código, é necessário ter instalado o LCOV. Após instalar o LCOV, execute os seguintes comandos na raiz do projeto:

```bash
flutter test flutter test --coverage
```

```bash
genhtml -o coverage/html coverage/lcov.info
```

```bash
open coverage/html/index.html
```

Após executar os comandos, a cobertura de código será exibida em um navegador.

![Cobertura de código](/assets/repo/coverage.png)

---

## 📸 Capturas de telas

| Tela Inicial                                                         | Criar tarefa                                      | Tarefas Feitas                                     |
| -------------------------------------------------------------------- | ------------------------------------------------- | -------------------------------------------------- |
| ![Tela Inicial](/assets/repo/unlogged-initial-screen-with-tasks.png) | ![Criar](/assets/repo/unlogged-creating-task.png) | ![Done](/assets/repo/unlogged-done-with-tasks.png) |

---

## ⬇ Baixe nas lojas de aplicativos

### Disponível para Android
<p>
  <a href="https://play.google.com/store/apps/details?id=com.anjasolutions.Tiutiu&hl=pt">
    <img src="assets/repo/Play Store Logo.png" alt="Play Store Download" width="256"/>
  </a>  
</p>


---

## 🌟 Funcionalidades Principais

### 📝 Criar uma nova Tarefa

Doar um animal nunca foi tão fácil! Com poucos cliques, você pode criar um anúncio completo, incluindo fotos, descrições detalhadas e informações essenciais sobre o pet. O Tiu, Tiu também permite o acompanhamento das interações de potenciais adotantes em tempo real.

<table>  
  <tr>
    <td><img src="assets/repo/unlogged-creating-task.png" alt="Tela de Criar uma nova tarefa" width="200"/></td>    
  </tr>  
</table>

### 📱 Pesquisar tarefa por título ou descrição 
Encontre o animal ideal para adoção com nossos **filtros avançados**, que permitem buscas por raça, porte, idade, localização e outras características. O processo foi otimizado para que você encontre o companheiro perfeito rapidamente.

<table>  
  <tr>
    <td><img src="assets/repo/unlogged-search-found.png" alt="Pesquisar uma tarefa" width="200"/></td>    
  </tr>  
</table>

### 📱 Ver lista de tarefas completas 
Encontre o animal ideal para adoção com nossos **filtros avançados**, que permitem buscas por raça, porte, idade, localização e outras características. O processo foi otimizado para que você encontre o companheiro perfeito rapidamente.

<table>  
  <tr>
    <td><img src="assets/repo/unlogged-done-with-tasks.png" alt="Ver tarefas feitas" width="200"/></td>    
  </tr>  
</table>


### 🌍 Autenticação Básica
Nossa funcionalidade de **geolocalização avançada** permite que você encontre animais para adoção perto de sua localização atual. Isso facilita ainda mais o processo, ajudando a conectar adotantes a animais que estão próximos.

<table>
  <tr>
    <td align="center" colspan="2">Disponível Mundialmente</td>
  </tr>  
  <tr>
    <td><img src="assets/repo/auth-screen.png" alt="Brasil Selecionado" width="200"/></td>
    <td><img src="assets/repo/profile.png" alt="EUA Selecionado" width="200"/></td>    
    <td><img src="assets/repo/logged-initial-screen.png" alt="EUA Selecionado" width="200"/></td>    
  </tr>  
</table>

### ☾ Dark Mode
A **seção TiuTok** oferece uma experiência inovadora e envolvente, permitindo que você explore vídeos de animais disponíveis para adoção em uma interface contínua, semelhante ao TikTok. Descubra seu próximo amigo enquanto curte e compartilha vídeos adoráveis de pets!

<table>
  <tr>
    <td align="center" colspan="3">TiuTok</td>
  </tr>  
  <tr>
    <td><img src="assets/repo/creating-task-dark-mode.png" alt="TiuTok" width="200"/></td>    
    <td><img src="assets/repo/unlogged-initial-screen-dark-mode.png" alt="TiuTok" width="200"/></td>
    <td><img src="assets/repo/search-task-found-dark-mode.png" alt="TiuTok" width="200"/></td>    
    <td><img src="assets/repo/completed-dark-mode.png" alt="TiuTok" width="200"/></td>    
  </tr>  
</table>

### 🌐 Disponível em 7 idiomas
Compartilhe perfis de animais diretamente em suas redes sociais favoritas, como Instagram, Facebook e WhatsApp. Cada compartilhamento ajuda a aumentar a visibilidade de animais que precisam de um novo lar!

<table>  
  <tr>
    <td><img src="assets/repo/language.png" alt="Login nas Redes Sociais" width="200"/></td>
    <td><img src="assets/repo/language-dark-mode.png" alt="Login nas Redes Sociais" width="200"/></td>    
  </tr>  
</table>

## 🌐 Internacionalização
O Tiutiu está disponível em três idiomas: português, inglês e espanhol. A aplicação detecta automaticamente o idioma do dispositivo do usuário e ajusta a interface de acordo, proporcionando uma experiência personalizada e acessível para pessoas de diferentes regiões do mundo.

Se o seu dispositivo estiver configurado para qualquer um desses idiomas, o app será exibido automaticamente no idioma correspondente. Essa funcionalidade garante que todos os usuários possam navegar no Tiutiu com facilidade, independentemente da sua localização.


### 💬 Chat In-App
Com nosso **chat integrado**, adotantes e doadores podem se comunicar diretamente dentro do aplicativo, facilitando o processo de adoção. Perguntas sobre o animal, informações adicionais ou mesmo agendar visitas podem ser resolvidas rapidamente com o chat em tempo real.

<table>
  <tr>
    <td align="center" colspan="2">Chat Integrado</td>
  </tr>  
  <tr>
    <td><img src="assets/repo/Contacts Screen.png" alt="Lista de Contatos" width="200"/></td>
    <td><img src="assets/repo/Chat Screen.png" alt="Tela de Chat" width="200"/></td>    
  </tr>  
</table>

### 🔔 Notificações Push
Fique por dentro de novas oportunidades e interações com as **notificações push**. Receba alertas sobre novos animais disponíveis, mensagens no chat e atualizações dos seus anúncios de doação, tudo de forma conveniente.

<table>
<tr>
    <td align="center" colspan="2">Notificações em Segundo Plano</td>
  </tr> 
<tr>
<td><img src="assets/repo/Push Notification.jpeg" alt="TiuTok" width="200"/></td>
<td><img src="assets/repo/Push Notification 2.jpeg" alt="TiuTok" width="200"/></td>
</tr>
</table>

### 📊 Estatísticas de Adoção
Monitore o desempenho dos seus anúncios com **estatísticas detalhadas**. Saiba quantas visualizações o perfil de um animal teve, quantos contatos foram feitos e acompanhe o progresso até a adoção.

<table>
<tr>
    <td align="center" colspan="2">Formulário de Adoção e Meus Posts</td>
  </tr> 
<tr>
<td><img src="assets/repo/Adoption Form.jpeg" alt="TiuTok" width="200"/></td>
<td><img src="assets/repo/My Posts.jpeg" alt="TiuTok" width="200"/></td>
</tr>
</table>


### 🎯 Sistema de Favoritos
Adicione animais ao seu **sistema de favoritos**, facilitando o acompanhamento de pets que você tem interesse em adotar. Acompanhe seus favoritos e receba atualizações caso haja alguma mudança de status no processo de adoção.

<table>
  <tr>
    <td align="center" colspan="2">Favoritos</td>
  </tr>  
  <tr>
    <td><img src="assets/repo/Saved.png" alt="Posts Salvos" width="200"/></td>
    <td><img src="assets/repo/Saved 2.png" alt="Posts Salvos" width="200"/></td>    
  </tr>  
</table>

## 🚀 Tecnologias Utilizadas

O **Tiu, Tiu** foi construído com um conjunto de tecnologias modernas para oferecer a melhor experiência ao usuário:

- **Flutter**: Framework utilizado para garantir um aplicativo fluido tanto em Android quanto em iOS.
- **Firebase**: Implementado para autenticação, banco de dados em tempo real, notificações push, e mais.
  - **Firebase Functions**: Para lógica de backend em nuvem.
  - **Firebase Dynamic Links**: Para links dinâmicos que redirecionam para o app.
  - **Firebase Crashlytics**: Para monitoramento e correção de erros.
  - **Firebase Firestore**: Banco de dados NoSQL em tempo real.
  - **Firebase Firestorage**: Para armazenamento de imagens e vídeos.
  - **Firebase Hosting**: Utilizado para hospedar o site oficial.
- **REST API**: Para sincronização de dados eficiente e rápida.
- **Manipulação de Imagens e Vídeos**: Tratamento de mídia dentro do app, incluindo edição e upload.
- **Geolocalização Avançada**: Para encontrar animais próximos ao usuário.
- **Construção de PDFs**: Para geração de formulários de adoção personalizados diretamente no app.


---

## 🔮 Roadmap Futuro

Veja o que planejamos para as próximas versões:
- [ ] 📍 Mapa de Abrigos.
- [ ] ▶️  Melhorias na interface do TiuTok.
- [ ] 🤖 IA para Sugestão de Animais: Uso de inteligência artificial para recomendar animais com base nas preferências do usuário e no histórico de adoções.
- [ ] 🎮 Gamificação: Implementação de um sistema de recompensas para incentivar os usuários a engajar mais na plataforma, como ao completar perfis de doação.


---

## 📜 Licença
Este projeto está licenciado sob a [MIT License](LICENSE).

## 🌍 Links Importantes

- [Baixe o Tiu, Tiu na Play Store](https://play.google.com/store/apps/details?id=com.anjasolutions.Tiutiu&hl=pt)
- [Baixe o Tiu, Tiu na Apple Store](https://apps.apple.com/br/app/Tiutiu-ado%C3%A7%C3%A3o-de-animais/id1660325927)
- [Acesse o site oficial](https://www.anjasolutions.com/Tiutiu)
- [Visite o repositório no GitHub](https://github.com/AndreDrummer/Tiutiu)

---

## 🤝 Como Contribuir

Contribuições são bem-vindas! Se você deseja ajudar no desenvolvimento do **Tiu, Tiu**, siga os passos abaixo:

1. Faça um **fork** do repositório.
2. Crie uma **branch** para suas modificações.
3. Envie um **Pull Request** com suas sugestões.

Vamos construir juntos uma plataforma que ajude mais animais a encontrar seus lares para sempre!

## ⬇ Baixe agora

![Banner](assets/repo/banner.png)

<p>
  <a href="https://play.google.com/store/apps/details?id=com.anjasolutions.Tiutiu&hl=pt">
    <img src="assets/repo/Play Store Logo.png" alt="Play Store Download" width="256"/>
  </a>

  <a href="https://apps.apple.com/br/app/Tiutiu-ado%C3%A7%C3%A3o-de-animais/id1660325927">
    <img src="assets/repo/App Store Logo.png" alt="App Store Download" width="256" style="margin-right: 4px;"/>
  </a>
</p>
