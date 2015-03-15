package org.bright.sepe.rest;

import java.util.List;
import java.util.Map;

import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import org.bright.sepe.entity.OrderInfo;
import org.smart4j.framework.orm.DataSet;
import org.smart4j.framework.tx.annotation.Service;
import org.smart4j.framework.tx.annotation.Transaction;
import org.smart4j.plugin.rest.Rest;

@Service
@Rest("/order")
@Consumes(MediaType.APPLICATION_JSON)
@Produces(MediaType.APPLICATION_JSON)
public class OrderService {

    @GET
    @Path("/orders")
    public List<OrderInfo> getOrderList() {
        return DataSet.selectListWithSort(OrderInfo.class, "id asc");
    }

    @GET
    @Path("/order/{orderId}")
    public OrderInfo getOrder(@PathParam("orderId") long orderId) {
        return DataSet.select(OrderInfo.class, "id = ?", orderId);
    }

    @POST
    @Path("/order")
    @Transaction
    public boolean createOrder(Map<String, Object> orderFieldMap) {
        return DataSet.insert(OrderInfo.class, orderFieldMap);
    }

    @PUT
    @Path("/order/{orderId}")
    @Transaction
    public boolean updateOrder(@PathParam("orderId") long orderId, Map<String, Object> orderFieldMap) {
        return DataSet.update(OrderInfo.class, orderFieldMap, "id = ?", orderId);
    }

    @DELETE
    @Path("/order/{orderId}")
    @Transaction
    public boolean deleteOrder(@PathParam("orderId") long orderId) {
        return DataSet.delete(OrderInfo.class, "id = ?", orderId);
    }
}
