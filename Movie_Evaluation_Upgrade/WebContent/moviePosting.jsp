<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<a href="index.jsp">index</a>
<a href="movie.jsp">movie</a>
<form method="post" action="moviePostingAction.jsp">
	<table>
		<tbody>
			<tr>
				<td>Thumbnail</td>
				<td><input type="file" name="movieThumbnail" style="width: 500px;"></td>
			</tr>
			<tr>
				<td>Title</td>
				<td><input type="text" name="movieTitle" style="width: 100%;"></td>
			</tr>
			<tr>
				<td>Length</td>
				<td><input type="text" name="movieLength" placeholder="98 min" style="width: 100%;"></td>
			</tr>
			<tr>
				<td>Premiere</td>
				<td><input type="text" name="moviePremiere" placeholder="2013 (USA)" style="width: 100%;"></td>
			</tr>
			<tr>
				<td>Director</td>
				<td><input type="text" name="movieDirector" style="width: 100%;"></td>
			</tr>
			<tr>
				<td>Actor</td>
				<td><input type="text" name="movieActor" style="width: 100%;"></td>
			</tr>
			<tr>
				<td>Content</td>
				<td><textarea name="movieContent" placeholder="" style="width: 100%; height: 200px;"></textarea></td>
			</tr>
			<tr>
				<td>Show</td>
				<td><input type="text" name="movieShow" style="width: 100%;" placeholder="https://www.youtube.com/-----/------"></td>
			</tr>
		</tbody>
	</table>
	<input type="submit" value="posting">
</form>