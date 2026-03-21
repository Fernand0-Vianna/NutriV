require('dotenv').config();
const express = require('express');
const mongoose = require('mongoose');
const cors = require('cors');

const app = express();
const PORT = process.env.PORT || 3000;
const MONGO_URI = process.env.MONGO_URI;

// Middlewares
app.use(cors());
app.use(express.json());

// Conexão com o Banco de Dados
mongoose.connect(MONGO_URI)
  .then(() => console.log('MongoDB conectado com sucesso!'))
  .catch(err => console.error('Erro ao conectar com MongoDB:', err));

// Rotas
const authRoutes = require('./src/routes/authRoutes');
const mealRoutes = require('./src/routes/mealRoutes'); // Importa as rotas de refeição

app.get('/', (req, res) => {
  res.send('API NutriScan funcionando!');
});

app.use('/api/auth', authRoutes);
app.use('/api/meals', mealRoutes); // Usa as rotas de refeição

// Iniciar o servidor
app.listen(PORT, () => {
  console.log(`Servidor rodando na porta ${PORT}`);
});