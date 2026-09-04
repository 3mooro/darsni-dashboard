const fs = require('fs');
const path = require('path');
const glob = require('glob');

const coursesDir = '/home/omar/Desktop/my web/my-math-site/src/content/courses';
const files = glob.sync(`${coursesDir}/*.json`);

let sql = `DELETE FROM courses;\n`;
sql += `DELETE FROM sqlite_sequence WHERE name='courses';\n`; // Reset autoincrement

const sqlValues = [];

files.forEach(file => {
  const content = fs.readFileSync(file, 'utf8');
  const course = JSON.parse(content);
  
  const slug = path.basename(file, '.json');
  const title = course.title.replace(/'/g, "''");
  const instructor = course.instructor.replace(/'/g, "''");
  const rating = course.rating || 5.0;
  const image = course.image;
  const tag = course.tag || 'جديد';
  const level = course.level;
  const body = (course.body || `دورة ${title} للطلاب والطالبات.`).replace(/'/g, "''");
  
  const syllabus = JSON.stringify(course.syllabus || []).replace(/'/g, "''");
  const packages = JSON.stringify(course.packages || []).replace(/'/g, "''");
  
  sqlValues.push(`('${slug}', '${title}', '${instructor}', ${rating}, '${image}', '${tag}', '${level}', '${body}', '${packages}', '${syllabus}')`);
});

if (sqlValues.length > 0) {
  sql += `INSERT INTO courses (slug, title, instructor, rating, image, tag, level, body, packages, syllabus) VALUES \n`;
  sql += sqlValues.join(',\n') + ';\n';
}

fs.writeFileSync('/home/omar/Desktop/my web/darsni-dashboard/seed_math.sql', sql);
console.log('Generated seed_math.sql with ' + sqlValues.length + ' courses.');
