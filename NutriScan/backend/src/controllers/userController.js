// User controller
const userService = require('../services/userService');
const jwt = require('jsonwebtoken');
const config = require('../config');

const register = async (req, res) => {
    try {
        const user = await userService.registerUser(req.body);
        const payload = { user: { id: user.id } };
        const token = jwt.sign(payload, config.jwtSecret, { expiresIn: '1h' });
        res.status(201).json({ token, user: { id: user.id, name: user.name, email: user.email } });
    } catch (e) {
        res.status(400).json({ msg: e.message });
    }
};

const login = async (req, res) => {
    try {
        const { email, password } = req.body;
        const user = await userService.loginUser(email, password);
        const payload = { user: { id: user.id } };
        const token = jwt.sign(payload, config.jwtSecret, { expiresIn: '1h' });
        res.status(200).json({ token, user: { id: user.id, name: user.name, email: user.email } });
    } catch (e) {
        res.status(400).json({ msg: e.message });
    }
};

const getMe = async (req, res) => {
    try {
        const user = await userService.getUserById(req.user.id);
        res.status(200).json(user);
    } catch (e) {
        res.status(404).json({ msg: e.message });
    }
};

module.exports = {
    register,
    login,
    getMe,
};