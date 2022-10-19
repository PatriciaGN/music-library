const cohort = {
  name: 'Sept2022',
  id: 997,
  students: ['Raven', 'Robin', 'Magpie'],
};

function printStudents(cohort) {
  console.log(
    `${cohort.id} - ${cohort.name} - ${cohort.students.length} students in this cohort`
  );
}

printStudents(cohort);
