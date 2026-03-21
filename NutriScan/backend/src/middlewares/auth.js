// Auth middleware
const jwt = require('jsonwebtoken');
const config = require('../config');

const auth = (req, res, next) => {
    const token = req.header('x-auth-token');

    if (!token) {
        return res.status(401).json({ msg: 'Nenhum token, autorização negada' });
    }

    try {
        const decoded = jwt.verify(token, config.jwtSecret);
        req.user = decoded.user;
        next();
    } catch (e) {
        res.status(401).json({ msg: 'Token não é válido' });
    }
};

module.exports = auth;