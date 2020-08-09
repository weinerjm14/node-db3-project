const db = require('../data/dbConfig');
const { schema } = require('../data/dbConfig');

function find() {
  return db.select('*').from('schemes');
}

function findById(ID) {
  return db('schemes as s').where('s.id', ID).first();
}

function findSteps(ID) {
  return db('steps as s')
    .where('s.scheme_id', ID)
    .innerJoin('schemes', 'schemes.id', 's.scheme_id')
    .select('s.step_number', 's.instructions', 'schemes.scheme_name')
    .orderBy('s.step_number');
}

function remove(ID) {
  return db('schemes').where({ id: ID }).del();
}

function add(scheme) {
  return db('schemes')
    .insert(scheme)
    .then(id => {
      return findById(id[0]);
    });
}

function update(scheme, ID) {
  return db('schemes').where({ id: ID }).update(scheme);
}

module.exports = {
  find,
  findById,
  findSteps,
  remove,
  add,
  update,
};
