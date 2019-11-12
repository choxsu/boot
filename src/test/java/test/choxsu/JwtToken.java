package test.choxsu;

import com.alibaba.fastjson.JSONObject;
import com.jfinal.plugin.activerecord.Record;
import io.jsonwebtoken.*;

import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;
import javax.xml.bind.DatatypeConverter;
import java.util.HashMap;

public class JwtToken {

    private static final String token = "eyJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NzMxNzQ2NDksInN1YiI6IntcInJlY29tbWVuZF9tZW1iZXJfcGhvbmVcIjpcIjE5MTEyMTg4NzQyXCIsXCJtZW1iZXJfbm9cIjpcIjBkNGQyYjUyMWUxZjQzZjNhNTNkYzc0NWE1ZmQyNjc0XCIsXCJpcFwiOlwiMTkyLjE2OC4zLjE0NFwiLFwiY291bnRyeV9tb2JpbGVfY29kZVwiOlwiODZcIixcImluc2VydF90aW1lXCI6XCIyMDE5LTA2LTI5IDIzOjAxOjA2XCIsXCJyZW1hcmtcIjpcIuS4gOeCueeCueaPj-i_sFwiLFwicmVnX3NvdXJjZVwiOlwiMDFcIixcImVhcm5zX3JhdGVcIjpcIjNcIixcInVwZGF0ZV90aW1lXCI6XCIyMDE5LTEwLTE2IDEwOjAwOjM0XCIsXCJpc3V1ZWRBdFwiOjE1NzMxNzQ2NDk0MDMsXCJwaG9uZVwiOlwiMTg5OTYzMjczNjlcIixcInJlZ2lvbmFsX2NvbnRyaWJ1dGlvblwiOjM4Mi4yMjkwMSxcIndob2xlc2FsZV9jZW50ZXJcIjpcIjUwMDEwMVwiLFwiZWFybnNfdHlwZVwiOlwiMVwiLFwibmlja19uYW1lXCI6XCJDaG94U3VcIixcInJlY29tbWVuZF9tZW1iZXJcIjpcIjk4ZDRhNDUzZmQ5NjQxZjVhNGIzODY0NmM5ODYxOWM3XCIsXCJpZFwiOjU0OCxcInN0YXR1c1wiOlwiMVwifSIsImV4cCI6MTU3NDQ3MDY0OX0.amPq5LB47vNyC0YN66pTBoFrXWZTpSU-cwd_PcwpFeE";


    public static void main(String[] args) {
        SecretKey secretKey = generalKey();
        try {
            Claims claims = Jwts.parser()
                    .setSigningKey(secretKey)
                    .parseClaimsJws(token).getBody();
            String subject = claims.getSubject();
            HashMap<String,Object> parse = JSONObject.parseObject(subject, HashMap.class);
            Record record = new Record();
            record.setColumns(parse);
            System.out.println("record = " + record);
        } catch (SignatureException | MalformedJwtException e) {
            // don't trust the JWT!
            // jwt 签名错误或解析错误，可能是伪造的，不能相信
        } catch (ExpiredJwtException e) {
            // jwt 已经过期
        } catch (Throwable ex) {
            //其他错误
        }
    }

    private static SecretKey generalKey() {
        byte[] encodedKey = DatatypeConverter.parseBase64Binary("mySecret");
        return new SecretKeySpec(encodedKey, 0, encodedKey.length, "AES");
    }
}
