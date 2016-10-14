var gulp = require('gulp');
var clean = require('gulp-clean');
var watch = require('gulp-watch');
var connect = require('gulp-connect');
var sass = require('gulp-sass');
var cleanCSS = require('gulp-clean-css');
var sourcemaps = require('gulp-sourcemaps');
var autoprefixer = require('gulp-autoprefixer');
var imagemin = require('gulp-imagemin');

gulp.task('clean', function() {
	return gulp.src(['build'])
		.pipe(clean());	
})

gulp.task('cleanCache', function() {
	return gulp.src( '../../web/assets/*' )
		.pipe(clean({force: true}));	
});

gulp.task('cleansvn', function() {
	return gulp.src( ['../../web/assets/*' ,'../../runtime/*(cache|debug|logs)/*'] )
		.pipe(clean({force: true}));	
});

// scss
gulp.task('scss', function() {

	return gulp.src(['src/pages/**/*.scss', 'src/common/common.scss'], { base: 'src' })
		//.pipe(sourcemaps.init())
		.pipe(sass())
		.on('error', sass.logError)
		.pipe(cleanCSS())
		//.pipe(sourcemaps.write('.'))
		.pipe(gulp.dest('build'));

});

// images
gulp.task('images', function() {
    return gulp.src('src/**/*.+(png|jpg)')
        .pipe(imagemin())
        .pipe(gulp.dest('build'))
});

gulp.task('default', ['scss', 'images'], function() {

});

gulp.task('watch', function() {
	var watcher = gulp.watch('src/**/*', ['cleanCache', 'default']);
	/*watcher.on('change', function(event) {
	  

	});*/
	return watcher;

});

gulp.task('connect', function () {
  connect.server({
    name: 'Dev App',
    port: 12211,
    livereload: true
  });
});

// gulp.task('dev', ['connect', 'default', 'watch']);
gulp.task('dev', [ 'default', 'watch']);

