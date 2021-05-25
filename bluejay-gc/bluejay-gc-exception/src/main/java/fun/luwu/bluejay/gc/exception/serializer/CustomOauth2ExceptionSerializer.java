//package fun.luwu.bluejay.gc.exception.serializer;
//
//import com.fasterxml.jackson.core.JsonGenerator;
//import com.fasterxml.jackson.databind.SerializerProvider;
//import com.fasterxml.jackson.databind.ser.std.StdSerializer;
//import fun.luwu.bluejay.gc.exception.CustomOauth2Exception;
//
//import java.io.IOException;
//import java.util.Map;
//
///**
// * @author LimOps
// */
//public class CustomOauth2ExceptionSerializer extends StdSerializer<CustomOauth2Exception> {
//
//    protected CustomOauth2ExceptionSerializer(){
//        super(CustomOauth2Exception.class);
//    }
//
//    /**
//     * Method that can be called to ask implementation to serialize
//     * values of type this serializer handles.
//     *
//     * @param value    Value to serialize; can <b>not</b> be null.
//     * @param jsonGenerator     Generator used to output resulting Json content
//     * @param provider Provider that can be used to get serializers for
//     */
//    @Override
//    public void serialize(CustomOauth2Exception value, JsonGenerator jsonGenerator, SerializerProvider provider) throws IOException {
//        jsonGenerator.writeStartObject();
//        jsonGenerator.writeObjectField("code", value.getHttpErrorCode());
//        jsonGenerator.writeStringField("message", value.getMessage());
//        if (value.getAdditionalInformation()!=null) {
//            for (Map.Entry<String, String> entry : value.getAdditionalInformation().entrySet()) {
//                String key = entry.getKey();
//                String add = entry.getValue();
//                jsonGenerator.writeStringField(key, add);
//            }
//        }
//        jsonGenerator.writeEndObject();
//    }
//
//}
