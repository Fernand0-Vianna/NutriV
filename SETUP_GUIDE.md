# 📋 Guia de Setup - NutriScan

## ✅ Status Atual

Toda a estrutura do projeto está **criada e configurada**! 

### Frontend (Flutter) ✓
- ✅ Estrutura clean architecture completa
- ✅ Todas as páginas criadas (Home, Daily Log, Archives, Capture, Profile)
- ✅ BLoC e State Management configurados
- ✅ Temas e assets adicionados
- ✅ Rotas definidas
- ✅ Bottom Navigation Bar
- ✅ pubspec.yaml com todas as dependências
- ✅ Android e iOS apps configurados
- ⚠️ `flutter pub get` **NÃO foi executado ainda**

### Backend (Node.js) ✓
- ✅ Estrutura completa com controllers, services, models
- ✅ Autenticação JWT configurada
- ✅ Middleware de validação
- ✅ package.json com todas as dependências
- ✅ server.js com rotas de autenticação
- ✅ .env configurado (mas precisa de valores reais)
- ⚠️ `npm install` **NÃO foi executado ainda**
- ⚠️ MongoDB **precisa estar rodando**

---

## 🚀 Próximas Ações

### PASSO 1: Preparar Backend (Node.js)

```bash
# Navegue até a pasta backend
cd /workspaces/NutriV/NutriScan/backend

# Instale as dependências
npm install

# Inicie o servidor (em desenvolvimento)
npm run dev
```

**Observações:**
- O servidor rodará na porta `3000`
- Certifique-se de que **MongoDB está ativo** (local ou MongoDB Atlas)
- Atualize o arquivo `.env` com valores reais se necessário (JWT_SECRET, Cloudinary, etc.)
- Teste a API com: `curl http://localhost:3000`

---

### PASSO 2: Preparar Frontend (Flutter)

```bash
# Navegue até a pasta frontend
cd /workspaces/NutriV/NutriScan/frontend

# Obtenha as dependências
flutter pub get

# Execute em um emulador ou dispositivo
flutter run
```

**Observações:**
- Certifique-se de ter um emulador Android/iOS rodando
- Ou conecte um dispositivo físico via USB
- As imagens dos assets estão na pasta `frontend/assets/`

---

## ✨ O que foi corrigido

- ✅ **main.dart**: Alterado de `MyApp()` para `NutriScanApp()` (classe correta)

---

## 📦 Dependências Principais

### Frontend
- **flutter_bloc**: State Management
- **dio**: HTTP Client
- **camera**: Captura de fotos
- **permission_handler**: Gerenciar permissões
- **google_fonts**: Tipografia personalizada
- **image_picker** e **image_cropper**: Processamento de imagens

### Backend
- **express**: Framework web
- **mongoose**: ODM para MongoDB
- **jsonwebtoken**: Autenticação JWT
- **cloudinary**: Armazenamento de imagens
- **@google-cloud/vision**: Análise de imagens (IA)
- **bcryptjs**: Hash de senhas
- **cors**: CORS habilitado
- **nodemon**: Auto-restart em desenvolvimento

---

## 🔧 Customizações Necessárias

Antes de rodar, você pode querer:

1. **Backend .env:**
   - Alterar `JWT_SECRET` para uma chave segura
   - Adicionar credenciais do Cloudinary
   - Adicionar credenciais do Google Cloud Vision (opcional)
   - Alterar `MONGO_URI` se usar MongoDB Atlas

2. **Frontend Configurações:**
   - Adicionar ícone de app em `frontend/android/app/src/main/res/`
   - Customizar cores em `lib/core/constants/constants.dart`
   - Adicionar Firebase Messaging (opcional)

---

## 📝 Estrutura de Diretórios

```
NutriScan/
├── frontend/                          # App Flutter
│   ├── lib/
│   │   ├── main.dart                 # ✅ Corrigido
│   │   ├── app.dart
│   │   ├── core/                     # Configurações globais
│   │   ├── data/                     # Datasources e models
│   │   ├── domain/                   # Entidades e repositórios
│   │   └── presentation/             # UI (Páginas, BLoC, Widgets)
│   ├── assets/                       # ✅ Imagens adicionadas
│   ├── pubspec.yaml                  # ✅ Dependências prontas
│   └── android/                      # ✅ Android SDK
│
└── backend/                          # API Node.js
    ├── src/
    │   ├── config/                   # Configurações
    │   ├── controllers/              # Lógica de requisições
    │   ├── models/                   # Esquemas MongoDB
    │   ├── services/                 # Lógica de negócios
    │   ├── routes/                   # Definição de rotas
    │   ├── middlewares/              # Middlewares (auth, etc)
    │   └── utils/                    # Funções auxiliares
    ├── package.json                  # ✅ Dependências prontas
    ├── server.js                     # ✅ Servidor configurado
    └── .env                          # ✅ Variáveis de ambiente
```

---

## ✅ Verificação PRÉ-EXECUÇÃO

Antes de rodar os comandos, verifique:

- [ ] Flutter instalado: `flutter --version`
- [ ] Node.js instalado: `node --version` & `npm --version`
- [ ] Emulador Android/iOS disponível (ou dispositivo conectado)
- [ ] MongoDB em execução (localmente ou via Atlas)
- [ ] Porta 3000 disponível para o backend
- [ ] Terminal já está na pasta `/workspaces/NutriV/NutriScan`

---

## 🎯 Ordem Recomendada de Execução

1. **Backend primeiro** (precisa estar rodando para o app funcionar)
2. **Frontend depois** (será mais rápido e funcional)

---

## 🐛 Troubleshooting

**Backend não inicia?**
- Verifique se MongoDB está em execução
- Verifique a MONGO_URI no `.env`
- Execute `npm install` novamente

**Flutter pub get falha?**
- Execute `flutter clean`
- Depois `flutter pub get`

**App não conecta ao backend?**
- Verifique se o backend está rodando em puerto 3000
- Verifique a URL em `lib/core/config/config.dart`
- Em emulador, pode precisar usar `10.0.2.2` em vez de `localhost`

---

**Pronto para rodar? Execute os comandos dos PASSOS 1 e 2 acima! 🚀**
