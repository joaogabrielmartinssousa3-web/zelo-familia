const express = require('express');
const cors = require('cors');
const app = express();

app.use(cors());
app.use(express.json());

// API 1 e 2 
app.post('/api/medicamentos', (req, res) => {
    const { dosagem } = req.body;
    if (dosagem <= 0) return res.status(400).json({ status: "erro", mensagem: "Dosagem inválida" });
    if (dosagem > 50) return res.status(400).json({ status: "erro", mensagem: "Dosagem excede limite" });
    res.status(201).json({ status: "sucesso", mensagem: "Medicamento registrado" });
});
app.post('/api/usuários', (req, res) => {
    const { idade } = req.body;
    if (idade < 11) return res.status(400).json({ status: "erro", mensagem: "Idade insuficiente" }); 
    res.status(201).json({ status: "sucesso", mensagem: "usuário cadastrado" });
});

// API 3 e 4 
app.post('/api/login', (req, res) => {
    const { senha } = req.body;
    if (senha.length < 6) return res.status(400).json({ status: "erro", mensagem: "Senha muito curta" });
    res.status(200).json({ status: "sucesso", token: "jwt-token-123" });
});
app.delete('/api/tarefas/:id', (req, res) => {
    res.status(200).json({ status: "sucesso", mensagem: "Tarefa excluída" });
});

// API 5 e 6 
app.put('/api/tarefas/:id/concluir', (req, res) => {
    res.status(200).json({ status: "sucesso", mensagem: "Tarefa marcada como concluída" });
});
app.post('/api/cuidadores', (req, res) => {
    const { telefone } = req.body;
    if (!telefone.match(/^\d+$/)) return res.status(400).json({ status: "erro", mensagem: "Telefone deve conter apenas números" });
    res.status(201).json({ status: "sucesso", mensagem: "Cuidador cadastrado" });
});

// API 7 e 8 
app.get('/api/relatorios', (req, res) => {
    const { dias } = req.query;
    if (dias < 1) return res.status(400).json({ status: "erro", mensagem: "Mínimo de 1 dia para relatório" });
    res.status(200).json({ status: "sucesso", dados: [] });
});
app.post('/api/alertas', (req, res) => {
    res.status(200).json({ status: "sucesso", mensagem: "Alerta SOS disparado para familiares" });
});

app.listen(8080, () => {
    console.log('API do Zelo-Família pronta para os 8 testes no http://localhost:8080');
});